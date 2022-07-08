//
//  Requirements.md
//  IntroCarousal
//
//  Created by Karthik K Manoj on 08/07/22.
//

import Foundation


Requirements

1) Horizontal scroll view capable of displaying multiple full-screen (or almost full-screen) cards

2) Page control at center bottom (dots / UIPageControl)

3) Navigation: pan or swipe anywhere, or tap on page control to move between views

4) Can host any UIView or UIViewController for each page (but not a mix - either all views or all view controllers)

5) Must resize to handle rotation (landscape) or any other resizing (e.g. iPad single column view) (page width needs to adjust to match screen width)

6) Should optionally support infinite loop (e.g. cycle from last to first or first to last) (default: not infinite)

7) Advanced: a data source where prev/next view can be lazily loaded on demand rather than having to load all at once. This would allow us to support really large carousels without memory issues. (But: without a count, the page control is not usable) In theory you only ever need current view plus 1 other (depends on the side the user is panning/swiping towards) or max current view plus 2 others (previous & next)

8) Optional: should we consider card-style interface where there’s some framing around each view and user can see the edge of both previous and next views? (i.e. case where each view is slightly less wide than the carousel). This would probably involve drop shadows and corner radius/border for the cards (although could also be chrome-less).

9) Add optional auto-play support for infinite scrolling feature.
        
    With configurable delay time to pause on each screen.

    Auto-play should not move if user is actively interacting (e.g. touch down).

    Optional setting to whether autoplay is disabled on touch:

    true: if user interacts (swipes), then auto-play is disabled.
    
    false: if user interacts (swipes), then auto-play continues but timer resets to 0.

    Auto-play to new page must update the page indicator (same as if user had manually swiped).

10) Extendable: can be subclassed or extended

11) Customizable: show/hide page control, theming

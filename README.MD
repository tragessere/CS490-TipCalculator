# Pre-work - TipCalculator

TipCalculator is a tip calculator application for iOS.

Submitted by: Evan Tragesser

Time spent: 7 hours spent in total

## User Stories

The following **required** functionality is complete:
* [√] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [√] Settings page to change the default tip percentage.
* [√] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [√] Using locale-specific currency and currency thousands separators.
* [√] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [√] Ability to change all three tip percentage values

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/MDrBx5d.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

Dragging the touch listener to the bar above the view as was done in the video didn't pair it correctly. It had to be attached to the background specifically

Dark mode was very tedious, just listing all of the views to change their colors individually. Not sure if there is a better way to do this.

Alignment in the settings seems to be done through auto-layout which was turned off at the start of this example in the video. Hopefully this is easier after learning auto-layout.

## License

Copyright [2016] [Evan Tragesser]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
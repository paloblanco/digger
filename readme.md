# Puzzle Dig
A digging game for pico-8 inspired by Tetris, Shovel Knight PD and Mr. Driller.

# Gameplay
Major difference from Mr. Driller is that the game will advance in turns, not real time. A turn() can be triggered by the player moving ( a la PD) or simply by waiting for time to elapse. Several things can/may/will happen each turn:
- Blocks will fall
- player will move or dig
- player will fall, if they are not on solid ground

Sequence of events in each turn:
- player input is received (animation should make the player feel like this can be done late)
- player moves in a direction, if player pressed a button
    - player will damage a block if they can
- player will fall if they can (need to hash out rules on this)
- blocks will fall if they can

Rules:
- player cannot drill falling blocks

Code:
- drawing might have to get fancy, but I should trigger a turn() function first to get the gameplay down




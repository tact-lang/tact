// Compose nested struct chain where bottom-most struct has remaining overlay
struct BottomMost { tail: Slice as remaining; }
struct Mid { x: BottomMost }
struct Top { y: Mid }

contract DeepTailOverlay {
  data: Top;
  init() {
    self.data = Top{ y: Mid{ x: BottomMost{ tail: emptyCell().asSlice() } } };
  }
}
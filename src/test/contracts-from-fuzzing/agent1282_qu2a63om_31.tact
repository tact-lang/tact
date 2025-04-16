// Chain: optional -> struct with nullable fields -> regular fields
struct MiddleLayer {
    data: String?;
    index: Int;
}

contract ChainOptionalMiddle {
    val: MiddleLayer?;

    init() {
        self.val = null;
    }
}

struct Leaf { x: Int? }
struct Wrap { leaf: Leaf? }
contract DeepOpts {
    data: Wrap? = null;
    init() {}
}
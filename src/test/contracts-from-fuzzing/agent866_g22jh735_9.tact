struct Deep { x: Int? }
struct Mid { d: Deep?; y: Bool }
struct Top { m: Mid; z: String; w: Int? }

contract NestedMix {
    val: Top;

    init() {
        self.val = Top{
            m: Mid{
                d: null,
                y: true
            },
            z: "z",
            w: null
        };
    }
}

contract Dummy { receive() {} }
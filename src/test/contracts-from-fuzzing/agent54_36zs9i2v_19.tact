struct InnerMost { x: Int; y: Bool; }
struct Middle { inner: InnerMost; opt: Int?; }
struct OuterMost { middle: Middle; flag: Bool; }

contract Layers {
    nest: OuterMost;

    init() {
        self.nest = OuterMost{
            middle: Middle{
                inner: InnerMost{ x: 7, y:true },
                opt: null
            },
            flag: false
        };
    }
}
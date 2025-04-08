struct Deep1 { x: Int; y: Bool; }
struct Deep2 { d: Deep1; z: Int; }
struct Deep3 { e: Deep2; flag: Bool; }
struct Deep4 { f: Deep3; msg: String; }

contract DeepNest {
    data: Deep4;

    init() {
        self.data = Deep4{
            f: Deep3{
                e: Deep2{
                    d: Deep1{ x: 3, y: true },
                    z: 5
                },
                flag: false
            },
            msg: "deep"
        };
    }
}
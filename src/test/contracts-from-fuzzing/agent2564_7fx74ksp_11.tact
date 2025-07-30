struct StructA { val: Int; }
struct StructB { a: StructA; flag: Bool; }
struct StructC { b: StructB; text: String?; }
struct StructD { c: StructC; more: String; }

contract DeepChain {
    data: StructD;

    init() {
        self.data = StructD{
            c: StructC{
                b: StructB{
                    a: StructA{ val: 5 },
                    flag: false
                },
                text: null
            },
            more: "done"
        };
    }
}
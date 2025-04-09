struct Str1 { a: Int; b: Bool; }
struct Str2 { c: String; d: Str1; }
struct Str3 { e: Str2; f: Slice; }
struct Str4 { g: Str3; h: Address; i: Cell; }
struct Str5 { j: Int?; k: Str4; }

contract TestDeepStruct {
    state: Str5;

    init() {
        self.state = Str5{
            j: null,
            k: Str4{
                g: Str3{
                    e: Str2{
                        c: "hello",
                        d: Str1{
                            a: 1,
                            b: true
                        }
                    },
                    f: emptyCell().asSlice()
                },
                h: myAddress(),
                i: emptyCell()
            }
        };
    }
}
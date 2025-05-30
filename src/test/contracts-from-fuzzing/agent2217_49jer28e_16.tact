struct NestA { a: Int; }
struct NestB { b: NestA; }
struct NestC { c: NestB; }
struct NestD { d: NestC; }

contract SuperDeep {
    deep: NestD;

    init() {
        self.deep = NestD{
            d: NestC{
                c: NestB{
                    b: NestA{a:42}
                }
            }
        };
    }
}

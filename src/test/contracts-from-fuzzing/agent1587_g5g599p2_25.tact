struct DeepA { foo: Int; }
struct DeepB { bar: DeepA; }
struct DeepC { baz: DeepB; }
struct DeepD { qux: DeepC; }
struct DeepE { corge: DeepD; }
struct DeepF { grault: DeepE; }

contract SixDeep {
    val: DeepF;

    init() {
        self.val = DeepF{
            grault: DeepE{
                corge: DeepD{
                    qux: DeepC{
                        baz: DeepB{
                            bar: DeepA{ foo: 123 }
                        }
                    }
                }
            }
        };
    }
}
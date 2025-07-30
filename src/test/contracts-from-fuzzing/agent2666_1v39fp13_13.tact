struct StrA {
    f: Int;
}

struct StrB {
    f: StrA;
}

struct StrC {
    f: StrB;
}

struct StrD {
    f: StrC;
}

struct StrE {
    f: StrD;
}

struct StrF {
    f: StrE;
}

contract VeryDeepObject {
    content: StrF;

    init() {
        self.content = StrF{
            f: StrE{
                f: StrD{
                    f: StrC{
                        f: StrB{
                            f: StrA{
                                f: 7
                            }
                        }
                    }
                }
            }
        };
    }
}
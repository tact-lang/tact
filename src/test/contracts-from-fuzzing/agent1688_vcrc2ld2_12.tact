struct LevelA { a: Int; }
struct LevelB { b: LevelA; }
struct LevelC { c: LevelB; }
struct LevelD { d: LevelC; }
struct LevelE { e: LevelD; }
struct LevelF { f: LevelE; }

contract TestContract {
    data: LevelF;

    init() {
        self.data = LevelF{
            f: LevelE{
                e: LevelD{
                    d: LevelC{
                        c: LevelB{
                            b: LevelA{
                                a: 42
                            }
                        }
                    }
                }
            }
        };
    }
}
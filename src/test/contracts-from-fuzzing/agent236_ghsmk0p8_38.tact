message(8888) DeepMsg { val: Int as uint8; }
struct LevelD { msg: DeepMsg; }
struct LevelC { child: LevelD; }
struct LevelB { child: LevelC; }
struct LevelA { child: LevelB; }

contract TestContract {
    root: LevelA;
    init() {
        self.root = LevelA{
            child: LevelB{
                child: LevelC{
                    child: LevelD{
                        msg: DeepMsg{val:200}
                    }
                }
            }
        };
    }
}
struct Level3 {
    a: Int as uint16;
    b: Bool?; 
}

struct Level2 {
    innerOpt: Level3?; 
    label: String = "l2";
}

struct Level1 {
    nestedOpt: Level2?;
    flag: Bool = true;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nestedOpt: null,
            flag: false
        };
    }
}
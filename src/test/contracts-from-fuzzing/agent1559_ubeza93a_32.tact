struct Layer1 {
    x: Int;
}

struct Layer2 {
    y: Layer1?;
}

struct RootStruct {
    z: Layer2;
}

contract DeepOptionals {
    root: RootStruct;
    init() {
        self.root = RootStruct{
            z: Layer2{
                y: null
            }
        };
    }
}
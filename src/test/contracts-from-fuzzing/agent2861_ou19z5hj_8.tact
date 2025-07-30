struct OptLevel3 {
    z: Int?;
}

struct OptLevel2 {
    opt3: OptLevel3?;
}

struct OptLevel1 {
    opt2: OptLevel2?;
}

contract NestedOptionals {
    top: OptLevel1;

    init() {
        self.top = OptLevel1{
            opt2: OptLevel2{
                opt3: OptLevel3{z:null}
            }
        };
    }
}
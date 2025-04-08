struct OptionalLevels {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract OptionalLevelsContract {
    val: OptionalLevels;

    init() {
        self.val = OptionalLevels{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}
struct OptDeepNested {
    flag: Bool;
    deep: OptDeeper?;
}

struct OptDeeper {
    intVal: Int?;
    txt: String?;
}

contract OptionalDeeperTest {
    data: OptDeepNested;

    init() {
        self.data = OptDeepNested{
            flag:true,
            deep:null
        };
    }
}
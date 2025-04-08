struct OptionalDeep {
    nested: Int?;
}

struct ContainerLevel2 {
    nested: OptionalDeep; 
}

struct ContainerLevel1 {
    nested2: ContainerLevel2;
}

contract OptionalDeepTest {
    data: ContainerLevel1;

    init() {
        self.data = ContainerLevel1{
            nested2: ContainerLevel2{
                nested: OptionalDeep{ nested: null }
            }
        };
    }
}
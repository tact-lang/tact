struct ContainerBool1 {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract TestContract {
    state: ContainerBool1;

    init() {
        self.state = ContainerBool1{
            flag1: true, flag2: false, flag3: true, flag4: false
        };
    }
}
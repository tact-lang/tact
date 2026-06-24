struct InnerOpt {
    z: Bool?;
}

contract DeepInitOpt {
    val: InnerOpt;

    init() {
        self.val = InnerOpt{z:true};
    }
}
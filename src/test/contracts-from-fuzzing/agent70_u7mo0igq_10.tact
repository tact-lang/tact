struct ManyOptionVar {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract TestContract {
    val: ManyOptionVar;

    init() {
        self.val = ManyOptionVar{
            x: 1,
            y: null,
            z: 3
        };
    }
}
struct WithOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    val: WithOptionals;

    init() {
        self.val = WithOptionals{ x: null, y: true, z: null };
    }
}
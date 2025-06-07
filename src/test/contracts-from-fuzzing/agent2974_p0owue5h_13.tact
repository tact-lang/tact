// optional message struct embedding in persistent state
message(100) Special {
    x: Int;
    y: Int?;
}

contract TestContract {
    storage: Special?;

    init() {
        self.storage = Special{
            x: 55,
            y: null,
        };
    }
}
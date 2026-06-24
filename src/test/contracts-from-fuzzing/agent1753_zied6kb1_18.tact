struct Ex {
    flag: Bool?;
}

contract OptionalFirst {
    data: Ex;

    init() {
        self.data = Ex{
            flag: null
        };
    }
}
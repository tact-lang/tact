struct LaterSet {
    x: Int?;
    y: Bool?;
}

contract PartialAssignAfterInit {
    data: LaterSet? = null;

    receive() {
        self.data = LaterSet{
            x: 1
            // omit y
        };
    }
}

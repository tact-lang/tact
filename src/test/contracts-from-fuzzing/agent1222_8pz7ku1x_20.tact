struct OptField {
    score: Int?;
}

contract TestContract {
    data: OptField;

    init() {
        let computed = 40 + 2;
        self.data = OptField{
            score: computed,
        };
    }

    receive() {
        let s = self.data.score;
    }
}
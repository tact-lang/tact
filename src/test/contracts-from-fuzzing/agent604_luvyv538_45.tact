contract AssignOptionalAfterInit {
    data: Int?;

    init() {
        self.data = null;
    }
}
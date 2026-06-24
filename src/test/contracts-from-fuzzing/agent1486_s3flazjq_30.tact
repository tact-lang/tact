contract AssignBeforeInit {
    a: Int;

    init() {
        self.a = 5;
    }
}

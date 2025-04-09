struct Nester0 {
    val: Int;
}
struct Nester1 {
    val: Nester0;
}
struct Nester2 {
    val: Nester1;
}
struct Nester3 {
    val: Nester2;
}
struct Nester4 {
    val: Nester3;
}
struct Nester5 {
    val: Nester4;
}
contract NesterContract {
    deep: Nester5;
    init() {
        self.deep = Nester5{ val: Nester4{ val: Nester3{ val: Nester2{ val: Nester1{ val: Nester0{ val: 42 } } } } } };
    }
}
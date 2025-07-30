struct Levels1 {
    val: Int;
}
struct Levels2 {
    l: Levels1;
}
struct Levels3 {
    l: Levels2;
}
struct Levels4 {
    l: Levels3;
}
struct Levels5 {
    l: Levels4;
}

contract LevelsDeep {
    field: Levels5 = Levels5{l:Levels4{l:Levels3{l:Levels2{l:Levels1{val:9000}}}}};
    init() {
        self.field = Levels5{l:Levels4{l:Levels3{l:Levels2{l:Levels1{val:42}}}}};
    }
    receive() {}
}
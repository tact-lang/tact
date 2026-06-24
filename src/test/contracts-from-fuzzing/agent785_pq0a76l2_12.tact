struct Wrapper {
    intVal: Int;
    text: String;
    flag: Bool;
}

struct BigContainer {
    first: Wrapper;
    second: Wrapper;
    third: Wrapper;
    fourth: Wrapper;
}

contract BigNest {
    dat: BigContainer;
    init() {
        self.dat = BigContainer{
            first: Wrapper{intVal: 1, text: "1", flag: true},
            second: Wrapper{intVal: 2, text: "2", flag: false},
            third: Wrapper{intVal: 3, text: "3", flag: true},
            fourth: Wrapper{intVal: 4, text: "4", flag: false}
        };
    }
}

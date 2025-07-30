contract WithInit {
    init() {
        // explicit init
    }

    receive() {}
}

contract Test {
    receive() {
        let s: StateInit = initOf WithInit();
        let code: Cell = s.code;
        let data: Cell = s.data;
    }
}

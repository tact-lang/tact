contract WithExplicitInit {
    init() {
        // explicit initialization logic
    }
    
    receive() {}
}

contract TestExplicitInit {
    receive() {
        let s: StateInit = initOf WithExplicitInit();
        let c: Cell = codeOf WithExplicitInit;
    }
}

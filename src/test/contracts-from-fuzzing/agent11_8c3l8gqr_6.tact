contract A {
    init() {
         // A calls initOf on B
         let bInit = initOf B();
    }
}

contract B {
    init() {
         // B calls initOf on A
         let aInit = initOf A();
    }
}

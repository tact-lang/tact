contract TestCastingCoercionFixed {
    receive() {
         let comment: Cell = "Tact is awesome!".asComment();
         let str: String = (42).toString();
    }
}

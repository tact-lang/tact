struct Param {
 x: Int;
 y: Bool;
 s: String;
 addr: Address;
 cell1: Cell;
 slice1: Slice;
 optI: Int?;
 optS: String?;
}

contract ComplexParams(
    param1: Param,
    param2: Param,
    param3: Param
) {
    receive() {
        // nothing
    }
}
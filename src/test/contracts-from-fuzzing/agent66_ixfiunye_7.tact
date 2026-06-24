fun sliceConversion(): String {
    let original: String = "Tact Fuzz";
    let sliceConverted: String = original.asSlice().asString();
    return sliceConverted;
}

contract TestContract {
    receive() {
        sliceConversion();
    }
}

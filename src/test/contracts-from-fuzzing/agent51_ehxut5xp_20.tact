contract Test {
    external("text") {
        // malformed: external receiver with a string param (external only allows struct param)
    }
}
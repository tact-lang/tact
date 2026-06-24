contract StringOptionalMismatch {
    a: String? = "default opt";
    b: String = "default";

    init() { self.a = null; self.b = "new"; }
}
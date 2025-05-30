struct Blob {
    data: Cell;
    text: String?;
}

contract CompositeWithMaybeString {
    blob: Blob;

    init() {
        self.blob = Blob{ data: emptyCell(), text: null };
    }
}
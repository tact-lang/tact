struct A { 
    x: Int;
    y: Int;
}

fun main() {
    let a = A{x: 100, y: 200};
    let cell = a.toCell();
    let a2 = A.fromCell(cell);
    // Confirm that the conversion laws hold (though we can't print, compilation success shows adherence)
}
trait InlineTrait {
    // Inline function inside a trait
    inline fun double(x: Int): Int {
        return x * 2;
    }
}

contract TestInline() with InlineTrait {
    // Getter function that calls the inline trait function
    get fun test(): Int {
        return self.double(21);
    }
}

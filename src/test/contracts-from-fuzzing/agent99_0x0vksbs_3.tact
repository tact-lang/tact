contract TestContract {
    receive() {
        dump("Hello\\nworld!");       // tests literal backslash and n
        dump("Line1\nLine2");          // newline escape
        dump("Quote: \"");            // double quote escape
        dump("Hex Quote: \x22");       // hex escape for quote
        dump("Unicode a: \u0061");      // standard unicode escape
        dump("Unicode smile: \u{1F600}"); // unicode escape with braces (😀)
    }
}

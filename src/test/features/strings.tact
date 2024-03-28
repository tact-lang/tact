contract StringsTester {
    init() {
        
    }
    
    receive() {
        // Deploy
    }

    get fun constantString(): String {
        return "test string";
    }

    get fun constantStringUnicode(): String {
        return "привет мир 👀";
    }

    get fun constantStringUnicodeLong(): String {
        return "привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀";
    }

    get fun dynamicStringCell(): Cell {
        let b: StringBuilder = beginString();
        b.append("Hello!");
        return b.toCell();
    }

    get fun dynamicCommentCell(): Cell {
        let b: StringBuilder = beginComment();
        b.append("Something something world!");
        return b.toCell();
    }

    get fun dynamicCommentCellLarge(): Cell {
        let b: StringBuilder = beginString();
        b.append("Hello!");
        b.append("привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀");
        return b.toCell();
    }

    get fun dynamicCommentStringLarge(): String {
        let b: StringBuilder = beginString();
        b.append("Hello!");
        b.append("привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀");
        return b.toString();
    }

    get fun stringWithNumber(): String {
        let b: StringBuilder = beginString();
        b.append("Hello, your balance: ");
        b.append(123.toString());
        return b.toString();
    }

    get fun stringWithNegativeNumber(): String {
        let b: StringBuilder = beginString();
        b.append("Hello, your balance: ");
        b.append((-123).toString());
        return b.toString();
    }

    get fun stringWithLargeNumber(): String {
        let b: StringBuilder = beginString();
        b.append("Hello, your balance: ");
        b.append(1000000000000000000000000000000000000000000000000000000000000.toString());
        return b.toString();
    }

    get fun stringWithFloat(): String {
        return 95.toFloatString(1);
    }

    get fun base64(): Slice {
        return "TWFueSBoYW5kcyBtYWtlIGxpZ2h0IHdvcmsu".fromBase64();
    }

    get fun processBase64(src: String): Slice {
        return src.fromBase64();
    }

    get fun stringWithEscapedChars1(): String {
        return "test \n \n \\ \\\n \"string\"";
    }

    get fun stringWithEscapedChars2(): String {
        return "test \n test \t test \r test \b test \f test \" test ' test \\ \\\\ \"_\" \"\" test";
    }

    get fun stringWithEscapedChars3(): String {
        return "test \\n test \\t test \\r test \\\\b\b test \\f test \\\" test \\' test \v \v \\\\ \\\\\\\\ \\\"_\\\" \\\"\\\" test";
    }

    get fun stringWithEscapedChars4(): String {
        return "\u{2028}\u{2029} \u0044 \x41\x42\x43";
    }
}
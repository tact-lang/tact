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
}
struct Mix {
    a: Int? = null;
    b: Bool? = null;
    c: Int = 1;
    d: Bool = false;
    e: Int? = null;
    f: Bool? = null;
    g: Int = -3;
    h: Bool = true;
    i: Int? = null;
    j: Bool? = null;
}

contract MixHolder {
    m: Mix = Mix{
        a: null, b: null, c: 1, d: false, e: null, f: null, g: -3, h: true, i: null, j: null
    };
}
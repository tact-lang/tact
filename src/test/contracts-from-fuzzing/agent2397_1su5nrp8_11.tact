struct StringsOnly { a: String; b: String; c: String; d: String; e: String; f: String; g: String; }

contract ManyStrings {
    s: StringsOnly = StringsOnly{ a:"A", b:"B", c:"C", d:"D", e:"E", f:"F", g:"G" };
    receive() {}
}
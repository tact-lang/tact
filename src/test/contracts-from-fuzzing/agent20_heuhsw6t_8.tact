extends fun toCoinsString2(self: Int): String {
    // Using 9 digits for coins representation, as per docs
    return self.toFloatString(9);
}

contract TestGlobalExtensionExpressions {
    fun showcase() {
         // Testing extension function call on Int
         let str = 5.toCoinsString2();
         dump(str); // expected: "0.000000005"
         
         // Testing compile-time global function: sha256
         let hash = sha256("test hash");
         dump(hash); // expected: compile-time computed SHA256 hash of "test hash"
         
         // Testing compile-time conversion function: ton
         let coin = ton("1");
         dump(coin); // expected: 1000000000 (1 Toncoin in nanoToncoin units)
    }

    receive() {
         self.showcase();
    }
}

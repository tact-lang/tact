contract TypeConversionExpressionsTestValid {
    receive() {
        // Proper usage of toString conversion
        dump((123).toString());
        
        // Proper usage of toFloatString conversion: we supply required argument
        let floatStr: String = (123).toFloatString(9); // Expected: "0.000000123"
        dump(floatStr);
        
        // toCoinsString is an alias to toFloatString(9) so expected to yield same result
        let coinsStr: String = (123).toCoinsString();
        dump(coinsStr);
        
        // Validate that both conversions give identical results
        dump(floatStr == coinsStr);
    }
}

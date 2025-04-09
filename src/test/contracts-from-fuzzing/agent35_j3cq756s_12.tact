contract OptionalExpressions {
    fun getMaybe() : Int? {
        return 42;
    }
    
    receive() {
        // Test with non-null optional
        let maybeVal: Int? = self.getMaybe();
        if (maybeVal != null) {
            let unwrapped = maybeVal!!; // force unwrap
        }
        
        // Test with null literal
        let noneVal: Int? = null;
    }
}

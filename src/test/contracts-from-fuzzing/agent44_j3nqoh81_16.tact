contract Test {
    fun deepNest(x: Int): Int {
        { 
            { 
                { 
                    if (x > 0) {
                        return 100;
                    }
                }
            }
        }
        return 0;
    }

    receive() {}
}

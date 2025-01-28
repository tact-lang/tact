primitive Int;

// This call fails with the default execution stack max level of 500.
const A: Int = multiplyByTwoDeepBlocks(200);

fun multiplyByTwoDeepBlocks(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwoDeepBlocks(-n);
    } else if (n == 0) {
        return 0;
    } else {     // When it enters this branch, each call creates 18 levels in the stack. 
        {        // Since the method is called 200 times, it would create around 3600 levels.
            { 
                {
                    {
                        {
                            {
                                {
                                    {
                                        {
                                            {
                                                {
                                                    {
                                                        {
                                                            {
                                                                {
                                                                    {
                                                                        {
                                                                            return 2 + multiplyByTwoDeepBlocks(n - 1);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
} 
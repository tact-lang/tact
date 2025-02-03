primitive Int;

const A: Int = multiplyByTwoDeepBlocks(1000);

fun multiplyByTwoDeepBlocks(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwoDeepBlocks(-n);
    } else if (n == 0) {
        return 0;
    } else {     
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
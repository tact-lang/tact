/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { Address } from "@/core/address/address";
import { BitBuilder } from "@/core/boc/bit-builder";

describe("BitBuilder", () => {
    it("should serialize uint", () => {
        const cases: [number, number, string][] = [
            [10290, 29, "00014194_"],
            [41732, 27, "0014609_"],
            [62757, 22, "03D496_"],
            [44525, 16, "ADED"],
            [26925, 30, "0001A4B6_"],
            [52948, 27, "0019DA9_"],
            [12362, 20, "0304A"],
            [31989, 16, "7CF5"],
            [8503, 21, "0109BC_"],
            [54308, 17, "6A124_"],
            [61700, 25, "0078824_"],
            [63112, 20, "0F688"],
            [27062, 29, "00034DB4_"],
            [37994, 30, "000251AA_"],
            [47973, 27, "00176CB_"],
            [18996, 25, "00251A4_"],
            [34043, 21, "0427DC_"],
            [8234, 18, "080AA_"],
            [16218, 26, "000FD6A_"],
            [40697, 25, "004F7CC_"],
            [43740, 27, "00155B9_"],
            [35773, 31, "0001177B_"],
            [32916, 18, "20252_"],
            [1779, 24, "0006F3"],
            [35968, 17, "46404_"],
            [15503, 23, "00791F_"],
            [25860, 21, "032824_"],
            [20651, 29, "0002855C_"],
            [14369, 16, "3821"],
            [28242, 24, "006E52"],
            [28446, 18, "1BC7A_"],
            [48685, 16, "BE2D"],
            [54822, 18, "3589A_"],
            [50042, 22, "030DEA_"],
            [11024, 30, "0000AC42_"],
            [44958, 26, "002BE7A_"],
            [20297, 27, "0009E93_"],
            [24757, 16, "60B5"],
            [36043, 29, "0004665C_"],
            [24210, 16, "5E92"],
            [49621, 29, "00060EAC_"],
            [63571, 17, "7C29C_"],
            [16047, 24, "003EAF"],
            [61384, 27, "001DF91_"],
            [57607, 25, "007083C_"],
            [32945, 30, "000202C6_"],
            [31215, 29, "0003CF7C_"],
            [3088, 21, "006084_"],
            [45519, 24, "00B1CF"],
            [53126, 26, "0033E1A_"],
        ];
        for (const c of cases) {
            const builder = new BitBuilder();
            builder.writeUint(c[0], c[1]);
            const bits = builder.build();
            expect(bits.toString()).toBe(c[2]);
        }
    });
    it("should serialize int", () => {
        const cases: [number, number, string][] = [
            [-44028, 22, "FD5012_"],
            [-1613, 16, "F9B3"],
            [-3640, 23, "FFE391_"],
            [45943, 22, "02CDDE_"],
            [-25519, 22, "FE7146_"],
            [-31775, 31, "FFFF07C3_"],
            [3609, 29, "000070CC_"],
            [-38203, 20, "F6AC5"],
            [59963, 28, "000EA3B"],
            [-22104, 21, "FD4D44_"],
            [1305, 21, "0028CC_"],
            [-40704, 30, "FFFD8402_"],
            [39319, 20, "09997"],
            [-39280, 27, "FFECD21_"],
            [48805, 21, "05F52C_"],
            [-47386, 21, "FA3734_"],
            [-24541, 22, "FE808E_"],
            [-11924, 30, "FFFF45B2_"],
            [16173, 22, "00FCB6_"],
            [25833, 23, "00C9D3_"],
            [27830, 22, "01B2DA_"],
            [50784, 31, "00018CC1_"],
            [-41292, 22, "FD7AD2_"],
            [-8437, 20, "FDF0B"],
            [-42394, 19, "EB4CD_"],
            [14663, 26, "000E51E_"],
            [-52314, 25, "FF99D34_"],
            [22649, 31, "0000B0F3_"],
            [-60755, 19, "E255B_"],
            [-28966, 17, "C76D4_"],
            [44151, 20, "0AC77"],
            [22112, 26, "0015982_"],
            [25524, 19, "0C769_"],
            [55597, 23, "01B25B_"],
            [4434, 28, "0001152"],
            [28364, 29, "00037664_"],
            [-5431, 25, "FFF564C_"],
            [35945, 17, "4634C_"],
            [49508, 19, "182C9_"],
            [-54454, 30, "FFFCAD2A_"],
            [-62846, 22, "FC2A0A_"],
            [-11725, 28, "FFFD233"],
            [-25980, 30, "FFFE6A12_"],
            [56226, 30, "00036E8A_"],
            [64224, 27, "001F5C1_"],
            [-52385, 29, "FFF99AFC_"],
            [33146, 24, "00817A"],
            [-4383, 27, "FFFDDC3_"],
            [4617, 23, "002413_"],
            [-20390, 21, "FD82D4_"],
        ];
        for (const c of cases) {
            const builder = new BitBuilder();
            builder.writeInt(c[0], c[1]);
            const bits = builder.build();
            expect(bits.toString()).toBe(c[2]);
        }
    });

    it("should serialize coins", () => {
        const cases: [string, string][] = [
            ["187657898555727", "6AAAC8261F94F"],
            ["220186135208421", "6C842145FA1E5"],
            ["38303065322130", "622D6209A3292"],
            ["99570315572129", "65A8F054A33A1"],
            ["14785390105803", "60D727DECD4CB"],
            ["244446854605494", "6DE52B7EF6AB6"],
            ["130189848588337", "676682FADB031"],
            ["82548661242881", "64B13DBA14C01"],
            ["248198532456807", "6E1BC395C6167"],
            ["192570661887521", "6AF2459E55E21"],
            ["72100014883174", "6419317C68166"],
            ["216482443674661", "6C4E3BF27C425"],
            ["11259492167296", "60A3D8E07EE80"],
            ["89891460221935", "651C17C8E0BEF"],
            ["267747267722164", "6F383C4C83BB4"],
            ["33545710125130", "61E827822C04A"],
            ["48663481749259", "62C42598B0F0B"],
            ["4122277458487", "603BFCAE23237"],
            ["112985911164954", "666C29519801A"],
            ["262936671139040", "6EF23B6E1B4E0"],
            ["137598454214999", "67D2522FC3157"],
            ["164191836706277", "69554E41A15E5"],
            ["225097218341260", "6CCB987BD398C"],
            ["253225616389304", "6E64EAEE9B4B8"],
            ["89031277771089", "650F935AF7951"],
            ["95175307882302", "6568FBA6AEF3E"],
            ["129805848629999", "6760EC77F52EF"],
            ["144714620593360", "6839DFF8DE4D0"],
            ["245178977211193", "6DEFD2DD7D339"],
            ["85630758278876", "64DE176EDD6DC"],
            ["12826827848685", "60BAA7A847BED"],
            ["112520990974580", "6665655B26274"],
            ["279110697598724", "6FDD985FBBF04"],
            ["213631116095525", "6C24BDEC9B025"],
            ["151538088541111", "689D2B5EFFBB7"],
            ["248258622846989", "6E1CA3706F80D"],
            ["124738812119884", "6717304960B4C"],
            ["20802268076562", "612EB67CC9A12"],
            ["227545530657711", "6CEF392866BAF"],
            ["120231499052120", "66D5993CAB458"],
            ["149349897829611", "687D53B9B7CEB"],
            ["189858289788838", "6ACACD3EBA7A6"],
            ["123762285255173", "6708FA70C9A05"],
            ["70958099290717", "64089384D5A5D"],
            ["124643854909101", "6715CE8B1FEAD"],
            ["7092186021168", "60673473A7D30"],
            ["52349283250349", "62F9C846EB0AD"],
            ["151939404432691", "68A30263A8533"],
            ["31720663732116", "61CD98AE4CF94"],
            ["132368134922315", "678635BA9604B"],
        ];
        for (const c of cases) {
            const builder = new BitBuilder();
            builder.writeCoins(BigInt(c[0]));
            const bits = builder.build();
            expect(bits.toString()).toBe(c[1]);
        }
    });

    it("should serialize address", () => {
        const cases = [
            [
                "Ef89v3kFhPfyauFSn_PWq-F6HyiBSQDZRXjoDRWq5f5IZeTm",
                "9FE7B7EF20B09EFE4D5C2A53FE7AD57C2F43E51029201B28AF1D01A2B55CBFC90CB_",
            ],
            [
                "Ef-zUJX6ySukm-41iSbHW5Ad788NYuWPYKzuAj4vLhe8WSgF",
                "9FF66A12BF592574937DC6B124D8EB7203BDF9E1AC5CB1EC159DC047C5E5C2F78B3_",
            ],
            [
                "Ef-x95AVmzKUKkS7isd6XF7YqZf0R0JyOzBO7jir239_feMb",
                "9FF63EF202B366528548977158EF4B8BDB1532FE88E84E476609DDC7157B6FEFEFB_",
            ],
            [
                "EQDA1y4uDTy1pdfReyOVD6WWGaAsD7CXg4SgltHS8NzITENs",
                "80181AE5C5C1A796B4BAFA2F6472A1F4B2C3340581F612F0709412DA3A5E1B99099_",
            ],
            [
                "Ef-BsrQDp9XMxUjQW2lnRAdZFKKzBXmATqX57NPO5fjbbEkn",
                "9FF036568074FAB998A91A0B6D2CE880EB22945660AF3009D4BF3D9A79DCBF1B6D9_",
            ],
            [
                "EQA4b5He6-GuoZqOmJzatkDPPtQGkYJTdvQ7XA-i4kAlYEHe",
                "80070DF23BDD7C35D43351D3139B56C819E7DA80D2304A6EDE876B81F45C4804AC1_",
            ],
            [
                "EQDxN0lwwcuGE0oGyGyFljgzTczy_n0yo2Fj1J-1ag_pSu9y",
                "801E26E92E183970C26940D90D90B2C70669B99E5FCFA6546C2C7A93F6AD41FD295_",
            ],
            [
                "Ef_Nmq7rexd9qNFbUPxdkl12cePfXWY92HXL2I6Xh6E-ijNC",
                "9FF9B355DD6F62EFB51A2B6A1F8BB24BAECE3C7BEBACC7BB0EB97B11D2F0F427D15_",
            ],
            [
                "Ef_8vupFqox91LEUEjSNFEgHHcyW7-iN6cCQd9kakf_dzxB2",
                "9FFF97DD48B5518FBA9622824691A28900E3B992DDFD11BD38120EFB23523FFBB9F_",
            ],
            [
                "Ef8hQISe1NQXMBaPlO_FAFkU2D1-oYOXAXVqfYSsxknuVJuM",
                "9FE4281093DA9A82E602D1F29DF8A00B229B07AFD43072E02EAD4FB09598C93DCA9_",
            ],
            [
                "Ef9krxCf0_HV1pThV4WyjfYC3myZP-omgJzfoaMUK_fQqrKX",
                "9FEC95E213FA7E3ABAD29C2AF0B651BEC05BCD9327FD44D0139BF43462857EFA155_",
            ],
            [
                "EQAi41iULCx-Hcx2hrV765AMPHkyJat8yPm1Xv8B5CJJ9a07",
                "80045C6B1285858FC3B98ED0D6AF7D7201878F2644B56F991F36ABDFE03C84493EB_",
            ],
            [
                "EQAk5wMibfzAT8qvaLX8PzbizxfHCYKkbgw1NNpzbrG2vKJm",
                "80049CE0644DBF9809F955ED16BF87E6DC59E2F8E130548DC186A69B4E6DD636D79_",
            ],
            [
                "Ef9316mrIrMHaMsqSxTHKmCsri2QfUGgjSoU1VQk9wRskj5s",
                "9FEEFAF535645660ED1965496298E54C1595C5B20FA83411A5429AAA849EE08D925_",
            ],
            [
                "EQDu6rzgRXKvqpiTRFf2SvDkn9aQEquPooKfHwvVQtUJ2If3",
                "801DDD579C08AE55F55312688AFEC95E1C93FAD2025571F45053E3E17AA85AA13B1_",
            ],
            [
                "Ef-XSsIAL-ln2ob2z8EYiPlxZsJXltjBLnhs0CHbr3Yey7GR",
                "9FF2E9584005FD2CFB50DED9F823111F2E2CD84AF2DB1825CF0D9A043B75EEC3D97_",
            ],
            [
                "EQARe21rkGPjHKVkzDtjRo-AOKa5vOULjr3Yl6i8-D6hJs2Z",
                "80022F6DAD720C7C6394AC99876C68D1F00714D7379CA171D7BB12F5179F07D424D_",
            ],
            [
                "Ef_fnsI3n6IBWCFBZS9svgj95Is69_P2a6k8QoNQT19RYqwX",
                "9FFBF3D846F3F4402B04282CA5ED97C11FBC91675EFE7ECD752788506A09EBEA2C5_",
            ],
            [
                "EQA6MrDnm_MOscSlWQL4Bx_gYxF9_0bvCQSs4F1EL0lv54ru",
                "800746561CF37E61D63894AB205F00E3FC0C622FBFE8DDE120959C0BA885E92DFCF_",
            ],
            [
                "EQD2LFXoHEGrBs284XDPYe8BZcVE1fJp5WrOiSnGM2_Dw5Tt",
                "801EC58ABD03883560D9B79C2E19EC3DE02CB8A89ABE4D3CAD59D12538C66DF8787_",
            ],
            [
                "EQBQoXKqbC5JhOcM1i_xFHHJICdv6OUiI3YVfeo-IEAbapgf",
                "800A142E554D85C9309CE19AC5FE228E392404EDFD1CA4446EC2AFBD47C408036D5_",
            ],
            [
                "Ef8d0NROO2-YRFbuZh-RnmrqyryQ1OtE-KyQQCh6zZWmB0qH",
                "9FE3BA1A89C76DF3088ADDCCC3F233CD5D5957921A9D689F159208050F59B2B4C0F_",
            ],
            [
                "Ef8LGU633NWIL-h8kgESfHMMaRXRtKIm27opFoiXLSGn3aqH",
                "9FE16329D6FB9AB105FD0F9240224F8E618D22BA369444DB774522D112E5A434FBB_",
            ],
            [
                "EQCu0fF1EQT0fCs73HLDyDYrRC4wEMN0J8AdsZy-yqBNeJ0H",
                "8015DA3E2EA2209E8F85677B8E587906C56885C602186E84F803B63397D95409AF1_",
            ],
            [
                "Ef9DoPbfWEYzwQudnHROcLFsmuB1kez5SYYz_m6sQAeGEW6q",
                "9FE8741EDBEB08C6782173B38E89CE162D935C0EB23D9F2930C67FCDD58800F0C23_",
            ],
            [
                "Ef_pRe-KC1renbNwq5JGHKKuvyKI1y0p_nY3j-Qs-kPkKEK-",
                "9FFD28BDF1416B5BD3B66E157248C39455D7E4511AE5A53FCEC6F1FC859F487C851_",
            ],
            [
                "EQCSqDjtytyMrd4IChBaJ33mJXUWEjyn26rbSf21W_tiS-DG",
                "801255071DB95B9195BBC101420B44EFBCC4AEA2C24794FB755B693FB6AB7F6C497_",
            ],
            [
                "Ef8Xu4ckjeYtb8xmZeolKZJt74gZMvA-fZKLoJen1CLTYdYJ",
                "9FE2F770E491BCC5ADF98CCCBD44A5324DBDF103265E07CFB2517412F4FA845A6C3_",
            ],
            [
                "Ef986fds8KNgpb2p5OFwKI05kfqhxlYvbZYMKfKvASPNfEiN",
                "9FEF9D3EED9E146C14B7B53C9C2E0511A7323F5438CAC5EDB2C1853E55E02479AF9_",
            ],
            [
                "EQAzICYYSfTBqnzhTEbbNcPdzPanjATBqQ9ZyYrINjMq91MA",
                "80066404C3093E98354F9C2988DB66B87BB99ED4F180983521EB39315906C6655EF_",
            ],
            [
                "Ef881mEgtzPmq69RfYUV6e6OAsfMW2C3lD4bDyl2dHXvvARm",
                "9FE79ACC2416E67CD575EA2FB0A2BD3DD1C058F98B6C16F287C361E52ECE8EBDF79_",
            ],
            [
                "EQBBh893C5iBTpdV1mHnvDLSlScISEw5PufX04I1MuCjTJ4L",
                "800830F9EEE1731029D2EABACC3CF7865A52A4E109098727DCFAFA7046A65C14699_",
            ],
            [
                "EQB0uqivkAXQQ_kFqTB2L00zeyhHiQ2JkE-N6F69zNuz_phQ",
                "800E975515F200BA087F20B5260EC5E9A66F6508F121B13209F1BD0BD7B99B767FD_",
            ],
            [
                "EQCOaaVT8TbdNRD0QwizJOkmrfDsGfaNxgpNdqGvxRNPHPQy",
                "8011CD34AA7E26DBA6A21E886116649D24D5BE1D833ED1B8C149AED435F8A269E39_",
            ],
            [
                "Ef8mOjz9HcpkjurmigPyhwkN2nkNKUcWUuiBgQzxTj11Yi7r",
                "9FE4C7479FA3B94C91DD5CD1407E50E121BB4F21A528E2CA5D1030219E29C7AEAC5_",
            ],
            [
                "Ef-rHHszbUfFU9IWiB5TSavxCVhMcbdR2uwKnEc9f77e9G_g",
                "9FF5638F666DA8F8AA7A42D103CA69357E212B098E36EA3B5D815388E7AFF7DBDE9_",
            ],
            [
                "EQAgq38o4LAPwY5nBfKS34imEMBYIBQbdXjH5KknTlq5XENb",
                "8004156FE51C1601F831CCE0BE525BF114C2180B0402836EAF18FC9524E9CB572B9_",
            ],
            [
                "EQAMyHiOpmQL8xc95ezg9mMWz358jGxczxEWt-Wk73g1touz",
                "8001990F11D4CC817E62E7BCBD9C1ECC62D9EFCF918D8B99E222D6FCB49DEF06B6D_",
            ],
            [
                "Ef9ftKMdNNBM_y9qjJ7JEa3YsSPhrQ78OwlG1TmbOPOvbE7H",
                "9FEBF69463A69A099FE5ED5193D92235BB16247C35A1DF876128DAA733671E75ED9_",
            ],
            [
                "EQAPjJNyikjoJBzmMzyz3YgQZKR0rbijFz2fbhPqNAJSmNpf",
                "8001F1926E51491D04839CC667967BB1020C948E95B71462E7B3EDC27D46804A531_",
            ],
            [
                "Ef921sRNxiOT67NFtaP-QXzrTXbhTJbqPqqOBHNaTRbsFG5Q",
                "9FEEDAD889B8C4727D7668B6B47FC82F9D69AEDC2992DD47D551C08E6B49A2DD829_",
            ],
            [
                "EQCkgMSMX2fKMnkhOIBR0R_dS6FAvb8-dqcTWxC5ahBcALBG",
                "80149018918BECF9464F2427100A3A23FBA9742817B7E7CED4E26B62172D420B801_",
            ],
            [
                "Ef_dXppgl_ly8_gDcWzyoZH8m9La4oki4MPPmP60d6XRiQUv",
                "9FFBABD34C12FF2E5E7F006E2D9E54323F937A5B5C51245C1879F31FD68EF4BA313_",
            ],
            [
                "Ef-15AOI3EB04jOnWO3B2U5hA93oSW9B6-JtwTVrQdkRDoCz",
                "9FF6BC80711B880E9C4674EB1DB83B29CC207BBD092DE83D7C4DB826AD683B2221D_",
            ],
            [
                "EQAtFb5CFAVRLYCwsJquH14oc3nd5qxM7InWT4-hPIqRpXKa",
                "8005A2B7C84280AA25B016161355C3EBC50E6F3BBCD5899D913AC9F1F427915234B_",
            ],
            [
                "Ef_l_SLp838E8C7buGVQW6L9y8DPq_Unj0JYx_gk7lqlSmzV",
                "9FFCBFA45D3E6FE09E05DB770CAA0B745FB97819F57EA4F1E84B18FF049DCB54A95_",
            ],
            [
                "EQCQ8zlbwcqPmZroXqqUFUWCwa8iVAjfVl6bdrRp3Bm2r1G3",
                "80121E672B783951F3335D0BD55282A8B05835E44A811BEACBD36ED68D3B8336D5F_",
            ],
            [
                "Ef_J98LIWrxKqDKUON1HLdempwpWK8dg0-tUtx2a7JlnD7tX",
                "9FF93EF8590B5789550652871BA8E5BAF4D4E14AC578EC1A7D6A96E3B35D932CE1F_",
            ],
            [
                "Ef_FhvoBZDe1c9uARsVnhfxe0sbtpeBR5FdN4fRlMwPP2ZTW",
                "9FF8B0DF402C86F6AE7B7008D8ACF0BF8BDA58DDB4BC0A3C8AE9BC3E8CA66079FB3_",
            ],
            [
                "EQDsbhBqKpU0YctnKpZzUBvMeMPRs3gJbuhCQ4jwnXFVdqLu",
                "801D8DC20D4552A68C396CE552CE6A03798F187A366F012DDD0848711E13AE2AAED_",
            ],
        ];
        for (const c of cases) {
            const builder = new BitBuilder();
            builder.writeAddress(Address.parse(c[0]!));
            const bits = builder.build();
            expect(bits.toString()).toBe(c[1]);
        }
    });
});

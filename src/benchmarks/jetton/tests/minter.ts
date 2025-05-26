import { beginCell, toNano } from "@ton/core";

import "@ton/test-utils";
import {
    sendMint,
    getTotalSupply,
    getJettonBalance,
    getAdminAddress,
    errors,
    sendChangeAdmin,
    getContent,
    jettonContentToCell,
    sendChangeContent,
    type FromInitMinter,
    type FromInitWallet,
    globalSetup,
} from "@/benchmarks/jetton/tests/utils";

export const testMinter = (
    fromInitMinter: FromInitMinter,
    fromInitWallet: FromInitWallet,
) => {
    const setup = async () => {
        return await globalSetup(fromInitMinter, fromInitWallet);
    };

    describe("JettonMinter", () => {
        // implementation detail
        it("minter admin should be able to mint jettons", async () => {
            const { jettonMinter, deployer, userWallet, notDeployer } =
                await setup();
            // can mint from deployer
            let initialTotalSupply = await getTotalSupply(jettonMinter);
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance = toNano("1000.23");
            const mintResult = await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                initialJettonBalance,
                toNano("0.05"),
                toNano("1"),
            );

            // Here was the check, that excesses are send to JettonMinter.
            // This is an implementation-defined behavior
            // In my implementation, excesses are sent to the deployer
            expect(mintResult.transactions).toHaveTransaction({
                // excesses
                from: deployerJettonWallet.address,
                to: deployer.address,
            });

            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply + initialJettonBalance,
            );
            initialTotalSupply += initialJettonBalance;
            // can mint from deployer again
            const additionalJettonBalance = toNano("2.31");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                additionalJettonBalance,
                toNano("0.05"),
                toNano("1"),
            );
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance + additionalJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply + additionalJettonBalance,
            );
            initialTotalSupply += additionalJettonBalance;
            // can mint to other address
            const otherJettonBalance = toNano("3.12");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                notDeployer.address,
                otherJettonBalance,
                toNano("0.05"),
                toNano("1"),
            );
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                otherJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply + otherJettonBalance,
            );
        });

        // implementation detail
        it("not a minter admin should not be able to mint jettons", async () => {
            const { jettonMinter, deployer, userWallet, notDeployer } =
                await setup();
            const initialTotalSupply = await getTotalSupply(jettonMinter);
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const unAuthMintResult = await sendMint(
                jettonMinter,
                notDeployer.getSender(),
                deployer.address,
                toNano("777"),
                toNano("0.05"),
                toNano("1"),
            );

            expect(unAuthMintResult.transactions).toHaveTransaction({
                from: notDeployer.address,
                to: jettonMinter.address,
                aborted: true,
                exitCode: errors["Incorrect sender"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply,
            );
        });

        // Implementation detail
        it("minter admin can change admin", async () => {
            const { jettonMinter, deployer, notDeployer } = await setup();
            const adminBefore = await getAdminAddress(jettonMinter);
            expect(adminBefore).toEqualAddress(deployer.address);
            const res = await sendChangeAdmin(
                jettonMinter,
                deployer.getSender(),
                notDeployer.address,
            );
            expect(res.transactions).toHaveTransaction({
                from: deployer.address,
                on: jettonMinter.address,
                success: true,
            });

            const adminAfter = await getAdminAddress(jettonMinter);
            expect(adminAfter).toEqualAddress(notDeployer.address);
            await sendChangeAdmin(
                jettonMinter,
                notDeployer.getSender(),
                deployer.address,
            );
            expect(
                (await getAdminAddress(jettonMinter)).equals(deployer.address),
            ).toBe(true);
        });

        it("not a minter admin can not change admin", async () => {
            const { jettonMinter, deployer, notDeployer } = await setup();
            const adminBefore = await getAdminAddress(jettonMinter);
            expect(adminBefore).toEqualAddress(deployer.address);
            const changeAdmin = await sendChangeAdmin(
                jettonMinter,
                notDeployer.getSender(),
                notDeployer.address,
            );
            expect(
                (await getAdminAddress(jettonMinter)).equals(deployer.address),
            ).toBe(true);
            expect(changeAdmin.transactions).toHaveTransaction({
                from: notDeployer.address,
                on: jettonMinter.address,
                aborted: true,
                exitCode: errors["Incorrect sender"],
            });
        });

        it("minter admin can change content", async () => {
            const { jettonMinter, deployer, defaultContent } = await setup();
            const newContent = jettonContentToCell({
                type: 1,
                uri: "https://totally_new_jetton.org/content.json",
            });
            expect(
                (await getContent(jettonMinter)).equals(defaultContent),
            ).toBe(true);
            await sendChangeContent(
                jettonMinter,
                deployer.getSender(),
                newContent,
            );
            expect((await getContent(jettonMinter)).equals(newContent)).toBe(
                true,
            );
            await sendChangeContent(
                jettonMinter,
                deployer.getSender(),
                defaultContent,
            );
            expect(
                (await getContent(jettonMinter)).equals(defaultContent),
            ).toBe(true);
        });

        it("not a minter admin can not change content", async () => {
            const { jettonMinter, notDeployer, defaultContent } = await setup();
            const newContent = beginCell().storeUint(1, 1).endCell();
            const changeContent = await sendChangeContent(
                jettonMinter,
                notDeployer.getSender(),
                newContent,
            );
            expect(
                (await getContent(jettonMinter)).equals(defaultContent),
            ).toBe(true);
            expect(changeContent.transactions).toHaveTransaction({
                from: notDeployer.address,
                to: jettonMinter.address,
                aborted: true,
                exitCode: errors["Incorrect sender"],
            });
        });
    });
};

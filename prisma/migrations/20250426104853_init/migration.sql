/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `ApproveStep` DROP FOREIGN KEY `ApproveStep_userId_fkey`;

-- DropForeignKey
ALTER TABLE `AuditLog` DROP FOREIGN KEY `AuditLog_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Department` DROP FOREIGN KEY `Department_headId_fkey`;

-- DropForeignKey
ALTER TABLE `LeaveBalance` DROP FOREIGN KEY `LeaveBalance_userId_fkey`;

-- DropForeignKey
ALTER TABLE `LeaveRequest` DROP FOREIGN KEY `LeaveRequest_userId_fkey`;

-- DropForeignKey
ALTER TABLE `LeaveRequestDetail` DROP FOREIGN KEY `LeaveRequestDetail_approverId_fkey`;

-- DropForeignKey
ALTER TABLE `Notification` DROP FOREIGN KEY `Notification_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Signature` DROP FOREIGN KEY `Signature_userId_fkey`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_departmentId_fkey`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_personnelTypeId_fkey`;

-- DropForeignKey
ALTER TABLE `UserRank` DROP FOREIGN KEY `UserRank_userId_fkey`;

-- DropForeignKey
ALTER TABLE `UserRole` DROP FOREIGN KEY `UserRole_userId_fkey`;

-- DropIndex
DROP INDEX `ApproveStep_userId_fkey` ON `ApproveStep`;

-- DropIndex
DROP INDEX `AuditLog_userId_fkey` ON `AuditLog`;

-- DropIndex
DROP INDEX `Department_headId_fkey` ON `Department`;

-- DropIndex
DROP INDEX `LeaveBalance_userId_fkey` ON `LeaveBalance`;

-- DropIndex
DROP INDEX `LeaveRequest_userId_fkey` ON `LeaveRequest`;

-- DropIndex
DROP INDEX `Notification_userId_fkey` ON `Notification`;

-- DropIndex
DROP INDEX `Signature_userId_fkey` ON `Signature`;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `departmentId` INTEGER NOT NULL,
    `personnelTypeId` INTEGER NOT NULL,
    `prefixName` VARCHAR(191) NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `sex` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `position` VARCHAR(191) NULL,
    `hireDate` DATETIME(3) NOT NULL,
    `inActive` BOOLEAN NOT NULL DEFAULT false,
    `employmentType` VARCHAR(191) NULL,
    `profilePicturePath` VARCHAR(191) NULL,

    UNIQUE INDEX `user_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `Department`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_personnelTypeId_fkey` FOREIGN KEY (`personnelTypeId`) REFERENCES `PersonnelType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Department` ADD CONSTRAINT `Department_headId_fkey` FOREIGN KEY (`headId`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AuditLog` ADD CONSTRAINT `AuditLog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserRole` ADD CONSTRAINT `UserRole_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Signature` ADD CONSTRAINT `Signature_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ApproveStep` ADD CONSTRAINT `ApproveStep_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserRank` ADD CONSTRAINT `UserRank_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeaveBalance` ADD CONSTRAINT `LeaveBalance_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeaveRequest` ADD CONSTRAINT `LeaveRequest_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LeaveRequestDetail` ADD CONSTRAINT `LeaveRequestDetail_approverId_fkey` FOREIGN KEY (`approverId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
